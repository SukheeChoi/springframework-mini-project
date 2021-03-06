package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {
	private int boardno;
	private String boardwriter;
	private String boardtitle;
	private String boardcontent;
	private Date boarddate;
	private String bimagecontenttype;
	private String bimageoriginalfilename;
	private String bimagesavedfilename;
	private MultipartFile battach;
	private int boardlike;
	private String backgroundColor;
	private boolean filecount;
	private int commentcount;
}
