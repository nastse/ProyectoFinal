package com.demo.dao.implementation;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;

	public class S3FileUploader{
		
	private static String bucketName     = "nastse-s";
	//private static String keyName        = "Object-"+UUID.randomUUID();
	
	public String fileUploader(List<FileItem> fileData, String imagen) throws IOException {
	   
		String keyName = imagen;
		
		AWSCredentials credentials = new BasicAWSCredentials(
				  "AKIAINEBIEIY2GQWODFQ", 
				  "33BDNgDQo5noOqzXM6yTvhdxoHqqiFVMF2Zw+mFV"
		);
		
		AmazonS3 s3client = AmazonS3ClientBuilder
				  .standard()
				  .withCredentials(new AWSStaticCredentialsProvider(credentials))
				  .withRegion(Regions.US_EAST_2)
				  .disableChunkedEncoding()
				  .build();
		
	    String result = "Upload unsuccessfull because ";
	    try {
	
	        S3Object s3Object = new S3Object();
	
	        ObjectMetadata omd = new ObjectMetadata();
	        omd.setContentType(fileData.get(0).getContentType());
	        omd.setContentLength(fileData.get(0).getSize());
	        omd.setHeader("filename", fileData.get(0).getName());
	
	        ByteArrayInputStream bis = new ByteArrayInputStream(fileData.get(0).get());
	
	        s3Object.setObjectContent(bis);
	        s3client.putObject(new PutObjectRequest(bucketName, keyName, bis, omd));
	        s3Object.close();
	
	        result = "Uploaded Successfully.";
	    } catch (AmazonServiceException ase) {
	       System.out.println("Caught an AmazonServiceException, which means your request made it to Amazon S3, but was "
	            + "rejected with an error response for some reason.");
	
	       System.out.println("Error Message:    " + ase.getMessage());
	       System.out.println("HTTP Status Code: " + ase.getStatusCode());
	       System.out.println("AWS Error Code:   " + ase.getErrorCode());
	       System.out.println("Error Type:       " + ase.getErrorType());
	       System.out.println("Request ID:       " + ase.getRequestId());
	
	       result = result + ase.getMessage();
	    } catch (AmazonClientException ace) {
	       System.out.println("Caught an AmazonClientException, which means the client encountered an internal error while "
	            + "trying to communicate with S3, such as not being able to access the network.");
	
	       result = result + ace.getMessage();
	     }catch (Exception e) {
	         result = result + e.getMessage();
	   }
	
	    return result;
	}
}