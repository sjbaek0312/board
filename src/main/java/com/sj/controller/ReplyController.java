package com.sj.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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

	@Inject private ReplyService replyService;
	
	// create
	@PostMapping(value = "/")
	public ResponseEntity<?> create(HttpSession session, @RequestBody ReplyVO replyVO)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		replyVO.setUserId(userVO.getUserId());
		replyVO.setReplyRegdate(new Date());
		replyVO.setReplyUpdatedate(new Date());
		replyVO.setReplyFlag('Y');
		replyService.create(replyVO, replyVO.getPostId());
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	// read
	@GetMapping(value = "/")
	public ResponseEntity<?> read(@RequestParam("postId") int postId)
	{
		return new ResponseEntity<>(replyService.readDepth0(postId), HttpStatus.OK);
	}
	@GetMapping(value = "/rereply")
	public ResponseEntity<?> readRereply(@RequestParam("replyId") int replyId)
	{
		return new ResponseEntity<>(replyService.readDepth1(replyId), HttpStatus.OK);
	}
	@GetMapping(value = "/replyReplycount")
	public ResponseEntity<?> readReplyReplyCount(@RequestParam("replyId") int replyId)
	{
		return new ResponseEntity<>(replyService.readReplyReplycount(replyId), HttpStatus.OK);
	}
	
	// update
	@PutMapping(value = "/{replyId}")
	public ResponseEntity<?> update(HttpSession session, @PathVariable("replyId") int replyId, @RequestBody ReplyVO replyVO)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		
		if (!replyService.validateReply(userVO.getUserId(), replyService.read(replyId).getUserId()))
		{
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		
		replyVO.setReplyId(replyId);
		replyVO.setReplyUpdatedate(new Date());
		replyService.update(replyVO);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	// delete
	@DeleteMapping(value = "/{postId}/{parentReplyId}/{replyId}")
	public ResponseEntity<?> delete(HttpSession session, @PathVariable("postId") int postId, @PathVariable("parentReplyId") int parentReplyId, @PathVariable("replyId") int replyId)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		ReplyVO replyVO = replyService.read(replyId);
		
		if (!replyService.validateReply(userVO.getUserId(), replyVO.getUserId()))
		{
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		
		replyService.delete(replyId, parentReplyId, postId);
		
		if(replyVO.getReplyReplycount() > 0)
		{
			List<ReplyVO> replyVOList = replyService.readDepth1(replyId);
			for (ReplyVO list : replyVOList)
			{
				replyService.delete(list.getReplyId(), replyId, postId);
			}
		}
		
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
}
