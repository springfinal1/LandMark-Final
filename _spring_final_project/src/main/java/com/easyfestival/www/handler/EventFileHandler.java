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

import com.easyfestival.www.domain.fileVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@Component
public class EventFileHandler 
{
	private final String UP_DIR="D:\\image\\event";
	
	public List<fileVO> uploadFiles(MultipartFile[] files)
	{
		List<fileVO> flist=new ArrayList<fileVO>();
		//파일경로,fvo set,파일저장...
		//날짜를 폴더로 생성하여 그날그날 업로드 파일을 관리
		LocalDate date=LocalDate.now(); //localdate객체
		String today =date.toString(); //2023-10-24
		today=today.replace("-",File.separator); //2023\10\24(win) ,2023/10/24(mac,renux)
		
		File folders = new File(UP_DIR,today);
		if(!folders.exists()) //폴더가 없다면 생성
		{
			folders.mkdirs();//mkdirs : 하위폴더 전체 생성 / mkdir : 폴더 하나만 생성
		}
		
		//files 객체에 대한 설정
		for(MultipartFile file: files) //들어온 첨부파일 1개씩 for문 처리
		{
			fileVO fvo=new fileVO();
			fvo.setSaveDir(today);
			fvo.setFileSize(file.getSize());
			String originalFileName=file.getOriginalFilename(); 
			//가끔 경로를 포함해서 들어 올수있어서 값을 떼서 전달
			String fileName=originalFileName.substring(originalFileName.lastIndexOf(File.separator)+1);
			fvo.setFileName(fileName);
			UUID uuid = UUID.randomUUID();
			fvo.setUuid(uuid.toString());
			//----------------------------기본 fileVO 생성 완료----------------------------------
			
			//하단부터 디스크에 저장할 파일 객체 생성
			//파일이름 uuid_fileName uuid_th_fileName
			String fullFileName = uuid.toString()+"_"+fileName;
			File storeFile = new File(folders,fullFileName);
			//file 객체가 저장이 되려면 첫 경로부터 다 설정이 되어 있어야함
			//D:\\_myweb\\_java\\fileUpload\\2023\\10\\24\\uuid_fileName.jpg
			try {
				file.transferTo(storeFile);//저장
				//썸네일 생성 => 이미지 파일만 썸네일 생성
				//이미지 파일인지 확인
				if(isImageFile(storeFile))
				{
					fvo.setFileType(1);
					//썸네일 생성
					File thumbnail = new File(folders,uuid.toString()+"_th_"+fileName);
					Thumbnails.of(storeFile).size(75, 75).toFile(thumbnail);
				}
			} catch (Exception e) {
				log.debug(">>> file 생성 오류~!!");
				e.printStackTrace();
			}
			flist.add(fvo); //flist에 fvo 추가
		}
		return flist;
	}
	private boolean isImageFile(File storeFile)throws IOException
	{
		String mimeType = new Tika().detect(storeFile); //image/jpg
		return mimeType.startsWith("image")? true:false;
	}
}
