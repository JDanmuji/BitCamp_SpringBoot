package user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import user.bean.UserDTO;
import user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;

	@GetMapping(value="writeForm")
	public String writeForm() {
		return "user/writeForm";
	}
	
	@PostMapping(value="write")
	@ResponseBody //무조건 jsp를 찾아감.
	public void write(@ModelAttribute UserDTO userDTO) {
		System.out.println(userDTO);
		
		userService.write(userDTO);
	}
	
	@GetMapping(value="list")
	public String listForm() {
		return "user/list";
	}
	
	@PostMapping(value="getUserList")
	@ResponseBody //무조건 jsp를 찾아감.
	public List<UserDTO> getUserList() {
		return userService.getUserList();
	}
	
	@PostMapping(value="isExistId")
	@ResponseBody //무조건 jsp를 찾아감.
	public String isExistId(@RequestParam String id) {
		return userService.isExistId(id);
	}
	
}
