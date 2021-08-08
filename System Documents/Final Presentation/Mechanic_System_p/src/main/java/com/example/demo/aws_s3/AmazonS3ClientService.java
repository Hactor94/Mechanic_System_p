package com.example.demo.aws_s3;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface AmazonS3ClientService
{
    void uploadFileToS3Bucket(MultipartFile multipartFile, boolean enablePublicReadAccess);
    void uploadProofToS3Bucket(File file, boolean enablePublicReadAccess) throws IOException;
    void deleteFileFromS3Bucket(String fileName);
    byte[] getFile(String key);
}
