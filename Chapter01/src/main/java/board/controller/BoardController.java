package board.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import board.bean.BoardDTO;

@RestController
public class BoardController {

	public BoardController() {
		System.out.println("BoardController 기본 생성자");
	}
	
	@GetMapping(value="/board/hello")
	//@ResponseBody
	public String hello(String name) {
		return "안녕하세욤" + name + "님";
	}
	
	@GetMapping(value="/board/getBoard")
	//@ResponseBody
	public BoardDTO getBoard() {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setSeq(1);
		boardDTO.setName("루피");
		boardDTO.setSubject("로제떡볶이");
		boardDTO.setLogtime(new Date());
		boardDTO.setContent("로제떡볶이안에 중국당면 추가해서 김말이 튀김에 싹 감싸서 먹으면 극락");
		
		return boardDTO;
	}
	
	@GetMapping(value="/board/getBoardList")
	//@ResponseBody
	public List<BoardDTO>  getBoardList() {
		List<BoardDTO> list = new ArrayList<>();
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setSeq(1);
		boardDTO.setName("루피");
		boardDTO.setSubject("로제떡볶이");
		boardDTO.setLogtime(new Date());
		boardDTO.setContent("로제떡볶이안에 중국당면 추가해서 김말이 튀김에 싹 감싸서 먹으면 극락");
		list.add(boardDTO);
		
		boardDTO = new BoardDTO();
		boardDTO.setSeq(2);
		boardDTO.setName("뽀로로");
		boardDTO.setSubject("크롱크롱크로롱");
		boardDTO.setLogtime(new Date());
		boardDTO.setContent("뽀로로 크롱크롱 크로오오옹");

		list.add(boardDTO);
		return list;
	}
}

/*
 * 외부 프로퍼티 사용 src/main/resources 의 application.properties 파일은 전체 프로젝트의 프로퍼티 정보를
 * 관리하는 설정 파일이다. 자바 소스보다 application.properties 설정이 우선순위가 높다. 자바 소스에서
 * WebApplicationType.NONE 으로 설정했어도 프로퍼티 설정의 우선순위가 높기 때문에 웹 애플리케이션이 실행된다.
 * 
 * application.properties에 설정한 프로퍼티 정보들은 실제 해당 Properties 객체의 Setter 메소드가 호출되어
 * 의존성이 주입된다는 것이다. Ctrl 키를 누른 상태에서 server.port에 마우스를 대면 하이퍼링크로 변한다. 링크를 클릭하면
 * ServerProperties 클래스의 setPort() 메소드가 선택된다.
 */

/*
 * @RestController는 JSP 같은 뷰를 별도로 만들지 않는 대신에 컨트롤러 메소드가 리턴하는 데이터 자체를 클라이언트로 보낸다.
 * 클라이언트에 전달되는 데이터는 문자열, DTO, 컬렉션 형태의 자바 객체인데, 자바 객체가 전달되는 경우에는 자동으로 JSON으로 변환하여
 * 처리하게 된다.
 */