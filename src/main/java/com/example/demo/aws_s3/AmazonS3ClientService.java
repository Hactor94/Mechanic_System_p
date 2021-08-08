package com.example.demo.aws_s3;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface AmazonS3ClientService
{
    void uploadFileToS3Bucket(MultipartFile multipartFile, boolean enablePublicReadAccess);
    void deleteFileFromS3Bucket(String fileName);
	byte[] downloadFile(String keyName) throws IOException;
}
