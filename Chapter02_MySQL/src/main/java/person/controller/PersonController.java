package person.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import person.bean.BoardPaging;
import person.bean.PersonDTO;
import person.service.PersonService;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;
	
	@GetMapping("/")
	public String main() {
		return "index";
	}
	

	@GetMapping(value="/person/writeForm")
	public String writeForm() {
		return "/person/writeForm";
	}
	

//  
  
  @PostMapping(value="/person/write", produces="text/html; charset=UTF-8")
  @ResponseBody
  public String upload(@RequestParam("img[]") List<MultipartFile> list, 
  					@ModelAttribute PersonDTO personDTO,
  					HttpSession session) throws Exception {
  	
	  System.out.println(personDTO.getAge());
	  System.out.println(personDTO.getName());
	  
	
	  
     String filePath = session.getServletContext().getRealPath("/storage");
      
     String fileName;
     File file;
     
     List<String> fileNameList = new ArrayList<>();
     
     
     for (MultipartFile img : list) {
  	   
  	   fileName = img.getOriginalFilename();
  	   file = new File(filePath, fileName);

  	   try {

  		   img.transferTo(file);
 			} catch (IllegalStateException | IOException e) {
 				// TODO Auto-generated catch block	
 				e.printStackTrace();
 			}
  	   
  	   
  	   personDTO.setPhoto(fileName);
  	   fileNameList.add(fileName);
     }
     
     
     personService.write(personDTO);
      

//      System.out.println(fileName);
//      
//      userImageDTO.setImage1(fileName);
      
      //UserService -> UserDAO -> UserMapper.xml
      
     //
      return "이미지 등록 완";
  }
  

	@GetMapping(value="/person/list")
	public ModelAndView list(@RequestParam int pg) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.setViewName("/person/list");
		
		System.out.println(pg);
		return mav;
	}

	@PostMapping(value="/person/getUserList")
	@ResponseBody //갖고있는 객체를 바로 JSON 형식으로 변경해준다.
	public Map<String, Object> getUserList(@RequestParam int pg) throws Exception  {
		System.out.println("userList" + pg);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//데이터
		List<PersonDTO> list = personService.getUserList(pg); 		
		//페이징 처리
		int totalA =  personService.getTotal();
				
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePaginHTML();
	
		
		map.put("list", list);
		map.put("pagingHTML", boardPaging.getPagingHTML().toString());
		
		return map;
	}
	
	

	
	/*
	 * @PostMapping(value="write")
	 * 
	 * @ResponseBody public void write(@ModelAttribute PersonDTO personDTO) throws
	 * Exception { userService.write(personDTO); }
	 */
}
