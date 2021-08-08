package com.example.demo.service;

import net.sf.jasperreports.engine.*;	
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import com.amazonaws.util.IOUtils;
import com.example.demo.dao.Appointment_Repo;
import com.example.demo.model.Appointment;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportService {

    @Autowired
    private Appointment_Repo repository;

    public MultipartFile exportReport(String reportFormat, int appointmentId, String report_name) throws JRException, IOException {
        String path = "C:\\Users\\NHLANHLA\\OneDrive\\Desktop\\System Documents\\Final Presentation\\Receipts Ex\\Mechanic_System_p";
        //report_name = path + "\\" + report_name;
        List<Appointment> appointment = repository.findAllByAppointmentId(appointmentId);
        String full_path = null;
        
        //load file and compile it
        File file = ResourceUtils.getFile("classpath:patient_report.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
        
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(appointment); 
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("createdBy", "Group B(Repeating)");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
        
        if (reportFormat.equalsIgnoreCase("html")) {
            JasperExportManager.exportReportToHtmlFile(jasperPrint, path + "\\" + report_name + ".html");
            full_path = path + "\\" + report_name + ".html";
        }
        if (reportFormat.equalsIgnoreCase("pdf")) {
            JasperExportManager.exportReportToPdfFile(jasperPrint, path + "\\" + report_name + ".pdf");
            full_path = path + "\\" + report_name + ".pdf";
        } 
        
        File file_s3 = new File(full_path);
        FileInputStream input = new FileInputStream(file_s3);
        MultipartFile multipartFile = new MockMultipartFile("file_s3",
        		file_s3.getName(), "text/plain", IOUtils.toByteArray(input));
        
		return multipartFile;
    }
}