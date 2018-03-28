package com.sj.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sj.service.ReplyService;
import com.sj.vo.ReplyVO;
import com.sj.vo.UserVO;

@RestController
@RequestMapping(value = "/reply")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	@Inject private ReplyService service;
	
	// create
	@PostMapping(value = "/")
	public ResponseEntity<?> create(HttpSession session, @RequestBody ReplyVO vo)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		vo.setUserId(userVO.getUserId());
		vo.setReplyRegdate(new Date());
		vo.setReplyUpdatedate(new Date());
		vo.setReplyFlag('Y');
		service.create(vo);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	// read
	@GetMapping(value = "/")
	public ResponseEntity<?> read(@RequestParam("postId") int postId)
	{
		return new ResponseEntity<>(service.list(postId), HttpStatus.OK);
	}
	@GetMapping(value = "/rereply")
	public ResponseEntity<?> readRereply(@RequestParam("replyId") int replyId)
	{
		return new ResponseEntity<>(service.listDepth1(replyId), HttpStatus.OK);
	}
	
	// update
	@PutMapping(value = "/{replyId}")
	public ResponseEntity<?> update(@PathVariable("replyId") int replyId, @RequestBody ReplyVO vo)
	{
		vo.setReplyId(replyId);
		vo.setReplyUpdatedate(new Date());
		service.update(vo);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	// delete
	@DeleteMapping(value = "/{replyId}")
	public ResponseEntity<?> delete(@PathVariable("replyId") int replyId)
	{
		service.delete(replyId);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
}
