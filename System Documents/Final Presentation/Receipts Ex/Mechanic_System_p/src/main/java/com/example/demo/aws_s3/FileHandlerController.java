package com.example.demo.aws_s3;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.example.demo.aws_s3.AmazonS3ClientService;
import com.example.demo.dao.Appointment_Repo;
import com.example.demo.model.Appointment;
import com.example.demo.service.ReportService;

import net.sf.jasperreports.engine.JRException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/files")
public class FileHandlerController {

    @Autowired
    private AmazonS3ClientService amazonS3ClientService;
    @Autowired private ReportService service;
    @Autowired Appointment_Repo appointment_repo;
    
    @PostMapping
    public ModelAndView uploadFile(@RequestParam("reportFormat") String reportFormat, @RequestParam("appointmentId") int appointmentId, @RequestParam("total_cost") double total_cost,  @RequestParam("report_name") String report_name) throws JRException, IOException
    {
    	Appointment appointment = appointment_repo.findById(appointmentId).orElse(null);
    	appointment.setAppointmentStatus("Pending Payment");
    	appointment.setTotal_cost(total_cost);
    	appointment_repo.save(appointment);
    	
    	MultipartFile file = service.exportReport(reportFormat, appointmentId, report_name + "_" + appointmentId);
        this.amazonS3ClientService.uploadFileToS3Bucket(file,true);
        
        AmazonS3Client s3Client  = (AmazonS3Client)AmazonS3ClientBuilder.standard()
        		.withRegion("us-east-2")
                .withPathStyleAccessEnabled(true)
                .build();
        String file_url = s3Client.getResourceUrl("mechanicreport-sys", file.getOriginalFilename());
        
        appointment.setReport(file.getOriginalFilename());
        appointment_repo.save(appointment);
        
        Map<String, String> response = new HashMap<>();
        response.put("message", "file [" + file.getOriginalFilename() + "] uploading request submitted successfully." + "URL:" + file_url);
        
        ModelAndView mv = new ModelAndView("redirect:/direct_to_dashboard");
        return mv;
    }
    
    @RequestMapping(value = "/proof_upload", method = RequestMethod.POST)
	public ModelAndView proof_upload(@RequestParam("file") File file, @RequestParam("carId") int carId) throws IOException {
    	this.amazonS3ClientService.uploadProofToS3Bucket(file.getAbsoluteFile(),true);
    	
    	Appointment appointment = appointment_repo.findById(carId).orElse(null);
    	appointment.setProof(file.getName());
    	appointment_repo.save(appointment);
    	
    	ModelAndView mv = new ModelAndView("redirect:/direct_to_dashboard");
        return mv;
	}
    
    @GetMapping
    public ResponseEntity<ByteArrayResource> uploadFile(@RequestParam(value = "file") String file) throws IOException {
        byte[] data = amazonS3ClientService.getFile(file);
        ByteArrayResource resource = new ByteArrayResource(data);

        return ResponseEntity
                .ok()
                .contentLength(data.length)
                .header("Content-type", "application/octet-stream")
                .header("Content-disposition", "attachment; filename=\"" + file + "\"")
                .body(resource);

    }

    @DeleteMapping
    public Map<String, String> deleteFile(@RequestParam("file_name") String fileName)
    {
        this.amazonS3ClientService.deleteFileFromS3Bucket(fileName);

        Map<String, String> response = new HashMap<>();
        response.put("message", "file [" + fileName + "] removing request submitted successfully.");

        return response;
    }
}