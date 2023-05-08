package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public void write() {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId("hong");
		boardDTO.setName("홍진호");
		boardDTO.setSubject("콩콩");
		boardDTO.setContent("어 글씨가 두 번 써지네? 어 글씨가 두 번 써지네?");
		
		boardDAO.save(boardDTO);
		
		boardDTO = new BoardDTO();
		boardDTO.setId("IM");
		boardDTO.setName("임요한");
		boardDTO.setSubject("1위");
		boardDTO.setContent("1위 가자");
		
		boardDAO.save(boardDTO);
		
		
		boardDTO = new BoardDTO();
		boardDTO.setId("FAKER");
		boardDTO.setName("페이커");
		boardDTO.setSubject("뉴욕 타임스퀘어");
		boardDTO.setContent("그저 빛");
		
		boardDAO.save(boardDTO);
	}

	@Override
	public List<BoardDTO> getBoardList() {
		return boardDAO.findAll();
	}

}
