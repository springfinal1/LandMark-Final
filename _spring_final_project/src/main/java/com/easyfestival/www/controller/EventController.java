package com.easyfestival.www.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.http.HttpResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfestival.www.domain.AttendanceHistoryVO;
import com.easyfestival.www.domain.attendanceVO;
import com.easyfestival.www.domain.eventDTO;
import com.easyfestival.www.domain.eventVO;
import com.easyfestival.www.domain.prizeVO;
import com.easyfestival.www.domain.rouletteVO;
import com.easyfestival.www.service.EventService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/event/*")
public class EventController {
	
	private final String UPLOAD_DIR="C:\\upload_file\\event";
	
	private int isOk;

	@Inject
	private EventService esv;

	@GetMapping("/eventRegister")
	public String eventRegister() {
		log.info("asdas21412421");
		return "/event/EventRegister";
	}
//
	@PostMapping("/eventRegister")
	public String eventRegister(@ModelAttribute("edto") eventDTO edto) {
		log.info("edto는???" + edto);
		//log.info("prizes는?"+edto.getPrizes());
		
		esv.eventRegister(edto.getEvo());
		
		if(edto.getEvo().getEvType().equals("rouletteEv")) //이벤트타입이 룰렛이면
		{
			rouletteVO rlvo=new rouletteVO();
			rlvo.setEvNo(esv.lastEvno());
			String prizes="";
			for(int i=0;i<edto.getPrizes().size();i++) 
			{	//배열 합쳐서 문자열 만들기
				prizes+=edto.getPrizes().get(i);
				if(i!=edto.getPrizes().size()-1)
					prizes+=",";
			}
			rlvo.setPrizes(prizes);
			
			log.info("rlvo:"+prizes);

			esv.rouletteRegister(rlvo);
		}
		else if(edto.getEvo().getEvType().equals("AttendanceEv"))	//이벤트타입이 출석체크면
		{
			attendanceVO atvo=new attendanceVO();
			atvo.setEvNo(esv.lastEvno());
			atvo.setFullAttendancePrize(edto.getAtvo().getFullAttendancePrize());
			atvo.setPoint(edto.getAtvo().getPoint());
			atvo.setMaxAttendanceCount(edto.getAtvo().getMaxAttendanceCount());
			atvo.setSpecialPointCount(edto.getAtvo().getSpecialPointCount());
			atvo.setSpecialPoint(edto.getAtvo().getSpecialPoint());
			esv.attendanceRegister(atvo);
		}
		
		return "redirect:/event/OneventList";
	}


	@PostMapping("/image")
    public ResponseEntity<String> handleImageUpload(@RequestParam("file") MultipartFile file) {
        try {
            // 업로드된 파일의 원래 이름
            String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
            String baseName = FilenameUtils.getBaseName(originalFilename);
            String extension = FilenameUtils.getExtension(originalFilename);
            
            // 파일 저장 경로 설정
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            String uniqueFileName = UUID.randomUUID().toString() + "_" + baseName+"."+extension;
            String urlEncodedFileName = URLEncoder.encode(uniqueFileName, StandardCharsets.UTF_8.toString());
            // 파일 저장
            Path filePath = uploadPath.resolve(uniqueFileName);
            Files.copy(file.getInputStream(), filePath);

            // 이미지의 상대 경로를 반환 (예: /upload/filename.jpg)
            String relativePath = "/Eupload/" + urlEncodedFileName;

            return ResponseEntity.ok(relativePath);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error uploading image");
        }
    }
	
	@GetMapping("/OneventList")
	public String OneventList(Model m)
	{
		LocalDateTime now=LocalDateTime.now();
		
		List<eventVO>eList=esv.OneventList(now);
		for(int i=0;i<eList.size();i++)	//썸네일 따오기
		{
			if(eList.get(i).getEvContent().contains("<img"))
			{
				String content=eList.get(i).getEvContent();
				String img=content.substring(content.indexOf("<img"), content.indexOf("\">")+2);
				String src=img.substring(img.indexOf("\"")+1,img.indexOf("\">"));
				eList.get(i).setThumbnail(src);
			}
		}
		
		log.info("이벤트리스트:"+eList);
		m.addAttribute("list", eList);
		m.addAttribute("msg","on");
		return "/event/EventList";
	}
	
	@GetMapping("/LasteventList")
	public String LasteventList(Model m)
	{
		LocalDateTime now=LocalDateTime.now();
		
		List<eventVO>eList=esv.LasteventList(now);
		
		for(int i=0;i<eList.size();i++)	//썸네일 따오기
		{
			if(eList.get(i).getEvContent().contains("<img"))
			{
				String content=eList.get(i).getEvContent();
				String img=content.substring(content.indexOf("<img"), content.indexOf("\">")+2);
				String src=img.substring(img.indexOf("\"")+1,img.indexOf("\">"));
				eList.get(i).setThumbnail(src);
			}
		}
		
		log.info("이벤트리스트:"+eList);
		m.addAttribute("list", eList);
		m.addAttribute("msg","last");
		return "/event/EventList";
	}
	
	@GetMapping("/eventDetail")
	public String eventDetail(Model m,@RequestParam("evNo")int evNo)
	{
		eventVO evo=esv.detail(evNo);
		if(evo.getEvType().equals("AttendanceEv")) {
			attendanceVO atvo=esv.getAttendance(evNo);
			m.addAttribute("atvo", atvo);
		}
		
		m.addAttribute("evo", evo);
		return "/event/EventDetail";
	}
	
	@GetMapping("/eventRemove")
	public String eventRemove(@RequestParam("evNo")int evNo)
	{
		isOk=esv.eventRemove(evNo);
		return "redirect:/event/eventList";
	}
	@GetMapping("/eventModify")
	public String eventModify(Model m,@RequestParam("evNo")int evNo)
	{
		eventVO evo=esv.detail(evNo);
		m.addAttribute("evo", evo);
		return "/event/EventModify";
	}
	@PostMapping("/eventModify")
	public String eventModify(eventVO evo)
	{
		isOk=esv.eventModify(evo);
		return "redirect:/event/OneventList";
	}
	
	
	@PostMapping("/postPrize")
	public ResponseEntity<String> postPrize(@RequestBody prizeVO prvo)
	{
		log.info("prvo:"+prvo);
		isOk=esv.registerPrize(prvo);
		
		return isOk>0 ? new ResponseEntity<String>("1",HttpStatus.OK):new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@PostMapping(value = "/getPrize" )
	public ResponseEntity<String> getPrize(@RequestParam("evNo")int evNo) throws UnsupportedEncodingException
	{
		log.info("evNo:"+evNo);
		String prizes=esv.getPrize(evNo);
//		String prizesDecode = URLDecoder.decode(prizes,"UTF-8");
		log.info("prize 합친 결과"+prizes);

		
		return new ResponseEntity<String>(prizes,HttpStatus.OK);
	}
	
	@GetMapping("/attendance")
	public String attendance(String id,long evNo,Model m,RedirectAttributes redirectattributes)
	{
		LocalDate now=LocalDate.now();
		
		//같은 기록이 있는지 확인하기 위해 불러옴
		AttendanceHistoryVO ahvo=esv.getAttendanceHistory(evNo,id,now);
		//현재 이벤트의 포인트 값을 사용하기위해 불러옴
		attendanceVO atvo=esv.getAttendance(evNo);
		
		if(ahvo==null) { //같은 기록이 없다면
			esv.attendanceHistory(evNo,id,now);//출석이벤트 기록 db에 저장
			esv.addpoint(id,atvo.getPoint()); //포인트 지급
			//지정횟수만큼 출석했을때마다 추가 포인트를 주기 위해서 몇번 출석했는지 값을 불러옴
			int AttendanceCount=esv.getAttendanceCount(evNo,id);
			if(AttendanceCount%atvo.getSpecialPointCount()==0)	//특정횟수만큼 출석하면 추가 포인트
			{
				esv.addSpecialPoint(id,atvo.getSpecialPoint());
			}
		}
		else {
			redirectattributes.addFlashAttribute("msg", "attendanced");	//model로 보내면 redirect를 거쳐서 값을 못씀
		}
		
		
		return "redirect:/event/eventDetail?evNo="+evNo;
	}
	
	@PostMapping("/getAttendanceCnt")
	public ResponseEntity<String> getAttendanceCnt(@RequestParam("id") String id,@RequestParam("evNo")long evNo)
	{
		
		int AttendanceCount=esv.getAttendanceCount(evNo, id);
		
		return new ResponseEntity<String>(String.valueOf(AttendanceCount) ,HttpStatus.OK);
	}

}
