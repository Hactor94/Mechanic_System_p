package com.example.demo.aws_s3;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.example.demo.aws_s3.AmazonS3ClientService;
import com.example.demo.dao.Car_Repo;
import com.example.demo.model.Car;
import com.example.demo.service.ReportService;

import net.sf.jasperreports.engine.JRException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.lang.System.Logger;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/files")
public class FileHandlerController {

    @Autowired
    private AmazonS3ClientService amazonS3ClientService;
    @Autowired private ReportService service;
    @Autowired Car_Repo car_repo;
    
    @PostMapping
    public ModelAndView uploadFile(@RequestParam("reportFormat") String reportFormat, @RequestParam("carId") int carId, @RequestParam("total_cost") double total_cost,  @RequestParam("brand") String brand) throws JRException, IOException
    {
    	Car car = car_repo.findById(carId).orElse(null);
    	car.setCarStatus("Pending Payment");
    	car.setTotal_cost(total_cost);
    	car_repo.save(car);
    	
    	MultipartFile file = service.exportReport(reportFormat, carId, brand + "_" + carId);
        this.amazonS3ClientService.uploadFileToS3Bucket(file,true);
        
        AmazonS3Client s3Client  = (AmazonS3Client)AmazonS3ClientBuilder.standard()
        		.withRegion("us-east-2")
                .withPathStyleAccessEnabled(true)
                .build();
        String file_url = s3Client.getResourceUrl("mechanicreport-sys", file.getOriginalFilename());
        
        car.setReport_url(file_url);
        car_repo.save(car);
        
        Map<String, String> response = new HashMap<>();
        response.put("message", "file [" + file.getOriginalFilename() + "] uploading request submitted successfully." + "URL:" + file_url);
        
        ModelAndView mv = new ModelAndView("redirect:/direct_to_dashboard");
        return mv;
    }
    
    @GetMapping
    public ResponseEntity<ByteArrayResource> downloadFile(@RequestParam(value= "fileName") final String keyName) throws IOException {
        final byte[] data = amazonS3ClientService.downloadFile(keyName);
        final ByteArrayResource resource = new ByteArrayResource(data);
        return ResponseEntity
                .ok()
                .contentLength(data.length)
                .header("Content-type", "application/octet-stream")
                .header("Content-disposition", "attachment; filename=\"" + keyName + "\"")
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