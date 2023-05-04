package person.dao;

import java.util.List;
import java.util.Map;

import person.bean.PersonDTO;


public interface PersonDAO {

	public void write(PersonDTO personDTO);

	public List<PersonDTO> getUserList(Map<String, Integer> map);

	public int getTotal();

	

}
