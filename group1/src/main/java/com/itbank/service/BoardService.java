package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;
import com.itbank.board.BoardHateDTO;
import com.itbank.board.BoardLikeDTO;
import com.itbank.club.ClubDAO;
import com.itbank.club.ClubDTO;
import com.itbank.member.MemberDTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

@Service
public class BoardService {

	@Autowired private BoardDAO dao;
	@Autowired private ClubDAO clubDAO;
	
	private final String serverIP = "192.168.0.85";
	private final int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;

//	private final String uploadPath = "C:\\upload";
	private final String uploadPath = "http://" +serverIP+ ":1234/";
	
	public List<BoardDTO> selectAll(HashMap<String, String> param) { // 전체 검색
		boolean flag1 = false, flag2 = false;
		if(param != null) {
			flag1 = param.size() == 2;
//			flag2 = param.get("search").equals("") == false;
		}
		return (flag1 && param.get("search").equals("") == false) ? dao.selectSearch(param) : dao.selectAll();
	}
	
	public List<BoardDTO> selectView() {
		return dao.selectView();
	}

	public List<BoardDTO> selectNew() {
		return dao.selectNew();
	}

	public BoardDTO select(int idxBo) { // 글 읽기
		return dao.select(idxBo);
	}

	public int insert(BoardDTO dto) throws Exception{ // 글 삽입
		int row = 0;
		
		if(dto.getFile().getOriginalFilename().equals("") == false) {
			
			String fileName = UUID.randomUUID().toString().replaceAll("-", "");
			int beginIndex = dto.getFile().getOriginalFilename().indexOf(".");
			String extName = dto.getFile().getOriginalFilename().substring(beginIndex);
			fileName += extName;
			
			File f = new File(uploadPath, fileName);
			
			try {
				dto.getFile().transferTo(f);
				
			} catch (IllegalStateException | IOException e) {
				System.out.println("업로드 문제 발생 : " + e);
			}
			System.out.println("f======="+f);
			
			String uploadFileName = upload(dto.getFile());
			dto.setUploadFile(uploadFileName);
			System.out.println("setuploadfile==========="+uploadPath+fileName);
			row = dao.insert(dto);
			
		}else {
			row = dao.insert(dto);
		}
		
		if(row != 0) {
			
		}
		
		return row;
	}
	

	public int selectMaxIdxBo() { 
		System.out.println("select Max IDX " + dao.selectMaxIdxBo());
		return dao.selectMaxIdxBo();
	}

	public int updateViewCount(int idxBo) {
		return dao.updateViewCount(idxBo);
	}

	public int delete(int idxBo) throws Exception{
		
		int row = dao.delete(idxBo);
		return row;
	}

	
	public BoardDTO selectOne(int idxBo) {
		return dao.selectOne(idxBo);
	}

	public int modify(BoardDTO dto) {
		
		int row = 0;
		
		if(dto.getFile().getOriginalFilename().equals("") == false) {
			
			String fileName = UUID.randomUUID().toString().replaceAll("-", "");
			int beginIndex = dto.getFile().getOriginalFilename().indexOf(".");
			String extName = dto.getFile().getOriginalFilename().substring(beginIndex);
			fileName += extName;
			
			File f = new File(uploadPath, fileName);
			
			try {
				dto.getFile().transferTo(f);
				
			} catch (IllegalStateException | IOException e) {
				System.out.println("업로드 문제 발생 : " + e);
			}
			dto.setUploadFile(fileName);
		}
		
		else {
		row = dao.modify(dto);
		}
		
		if(row != 0) {
		
		}
		
		return row;
}


	public List<BoardDTO> selectWriter(String writer) { // 내 글목록
		return dao.selectWriter(writer);
	}

	public int likeUp(String idxBo) {
		
		
		int row = dao.likeUp(idxBo);
		
		
		System.out.println("row : " + row);
		
		return row;
	}

	public List<BoardDTO> selectLike() {
		return dao.selectLike();
	}

	public List<BoardDTO> selectliv(HashMap<String, String> param) {
		
		return dao.selectLiv();
	}

	public List<BoardDTO> selectMu(HashMap<String, String> param) {
		return dao.selectMu();
	}
	
	public List<BoardDTO> selectMc(HashMap<String, String> param) {
		return dao.selectMc();
	}
	
	public List<BoardDTO> selectChelsea(HashMap<String, String> param) {
		return dao.selectChelsea();
	}
	
	public List<BoardDTO> selectArsenal(HashMap<String, String> param) {
		return dao.selectArsenal();
	}


	public int likeInsert(BoardLikeDTO Ldto) {
		System.out.println("nickName : " + Ldto.getLikeMember() + " / " );
		
		return dao.likeInsert(Ldto);
	}
	
	public int hateInsert(BoardHateDTO Hdto) {
		return dao.hateInsert(Hdto);
	}

	public BoardLikeDTO selectLikeMember(BoardLikeDTO boardLike) {
		System.out.println("selectLikeMember");
		
		return dao.selectLikeMember(boardLike);
	}


	public int likeDown(String idxBo) {
		return dao.likeDown(idxBo);
		
	}
	public BoardHateDTO selectHateMember(BoardHateDTO boardHate) {
		return dao.selectHateMember(boardHate);
	}

public String upload(MultipartFile file) throws Exception {
		
		
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();
		
		sess = jsch.getSession(serverUser,serverIP,serverPort);
		sess.setPassword(serverPass);
		sess.setConfig("StrictHostKeyChecking","no");
		
		sess.connect();
		System.out.println("sftp> Connected !!");
		
		channel= sess.openChannel("sftp"); //sftp(파일전송)
		channel.connect();
		
		chSftp= (ChannelSftp)channel;
		
		File tmp = new File(file.getOriginalFilename()); // 전송 준비끝
		file.transferTo(tmp);
		
		FileInputStream fis = new FileInputStream(tmp);
		chSftp.cd("/var/www/html");
		chSftp.put(fis, file.getOriginalFilename());

		System.out.println("sftp> transfer complete !!");
		
		fis.close();
		chSftp.exit();
		tmp.delete();
		
		System.out.println("sftp > exit");
		return "http://" +serverIP+ ":1234/" + file.getOriginalFilename();
	}

	public ClubDTO clubColor(String clubName) { //클럽닉네임을 받아서 dto를 셀렉트해서 값을 가져와서
		return clubDAO.setColor(clubName); //클럽컬러를 세팅
	}



	
}