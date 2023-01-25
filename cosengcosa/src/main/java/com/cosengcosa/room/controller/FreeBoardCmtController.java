package com.cosengcosa.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cosengcosa.room.service.FreeBoardService;

@Controller
public class FreeBoardCmtController {
	
	@Autowired
	FreeBoardService freeBoardService; 
	
	
	
}
