package person.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import person.bean.PersonDTO;
import person.dao.PersonDAO;

@Service
public class PersonServiceImpl implements PersonService {
	

	@Autowired
	private PersonDAO personDAO;

	@Override
	public void write(PersonDTO personDTO) throws Exception {
		personDAO.write(personDTO);
	}

	@Override
	public List<PersonDTO> getUserList(int pg) {
		int endNum = pg * 5;
		int startNum = endNum - 4;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return personDAO.getUserList(map);
	}

	@Override
	public int getTotal() {
		return personDAO.getTotal();
	}

	


}
