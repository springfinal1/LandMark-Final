package com.easyfestival.www.handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.easyfestival.www.domain.ProductFileVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@Component
public class FileHandler {

	private final String UP_DIR = "C:\\landmark_upload";
	
	public List<ProductFileVO> uploadFile(MultipartFile[] files){ 
		List<ProductFileVO> pfList = new ArrayList<ProductFileVO>();
		
		LocalDate date = LocalDate.now();
		String today = date.toString();
		today = today.replace("-", File.separator);
		
		File folders = new File(UP_DIR,today);
		if(!folders.exists()) {
			folders.mkdirs();
		}
		
		for(MultipartFile file : files) {
			ProductFileVO pfvo = new ProductFileVO();
			pfvo.setPfSaveDir(today);
			pfvo.setPfSize(file.getSize());
			
			String originalFileName = file.getOriginalFilename();
			
			String fileName = originalFileName.substring(originalFileName.lastIndexOf(File.separator)+1);
			pfvo.setPfName(fileName);
			
			UUID uuid = UUID.randomUUID();
			pfvo.setPfUuid(uuid.toString());
			
			String fullFileName = uuid.toString()+"_"+fileName;
			log.info(fullFileName);
			File storeFile = new File(folders, fullFileName);
			
			try {
				file.transferTo(storeFile);
				
				if(isImageFile(storeFile)) {
					File thumNail = new File(folders, uuid.toString()+"_th_"+fileName);
					Thumbnails.of(storeFile).size(75, 75).toFile(thumNail);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			pfList.add(pfvo);
		}
		
		
		return pfList;
	}
	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType = new Tika().detect(storeFile);
		return mimeType.startsWith("image")? true : false;
	}
	
}
 