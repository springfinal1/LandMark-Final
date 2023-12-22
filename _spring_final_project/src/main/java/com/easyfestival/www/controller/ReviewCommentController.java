package com.easyfestival.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easyfestival.www.domain.ReviewCommentVO;
import com.easyfestival.www.service.ReviewCommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reviewcmt/*")
public class ReviewCommentController 
{
	@Inject
	private ReviewCommentService rcsv;
	
	private int isOk;
		
	@PostMapping("/post")
	public ResponseEntity<String> ReviewCommentPost(@RequestBody ReviewCommentVO rcvo )
	{
		isOk=rcsv.ReviewCommentPost(rcvo);
		return isOk>0 ? new ResponseEntity<String>("1",HttpStatus.OK):new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@GetMapping(value="/{rvNo}",produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReviewCommentVO>> getCommentList(@PathVariable("rvNo")int rvNo)
	{
		List<ReviewCommentVO> list=rcsv.getCommentList(rvNo);
		log.info("댓글리스트:"+list);
		return new ResponseEntity<List<ReviewCommentVO>>(list,HttpStatus.OK);
	}
	
	@GetMapping(value = "/cnt/{rvNo}",produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String>getCommentCount(@PathVariable("rvNo")int rvNo)
	{
		log.info("getCommentCount 들어옴");
		log.info("rvNo는?"+rvNo);
		int cnt=rcsv.getCommentCount(rvNo);
		
		return cnt>=0? new ResponseEntity<String>(String.valueOf(cnt),HttpStatus.OK):new ResponseEntity<String>("-1",HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rcNo}",produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> DeleteComment(@PathVariable("rcNo")int rcNo)
	{
		isOk=rcsv.DeleteComment(rcNo);
		return isOk>0 ? new ResponseEntity<String>("1",HttpStatus.OK):new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@PutMapping("/{rcNo}")
	public ResponseEntity<String>ModifyComment(@PathVariable("rcNo")int rcNo,@RequestBody ReviewCommentVO rcvo)
	{
		isOk=rcsv.ModifyComment(rcvo);
		return isOk>0 ? new ResponseEntity<String>("1",HttpStatus.OK):new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
