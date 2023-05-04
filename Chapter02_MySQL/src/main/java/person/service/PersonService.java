
package person.service;

import java.util.List;

import person.bean.PersonDTO;


public interface PersonService {
	
	public void write(PersonDTO personDTO) throws Exception;

	public List<PersonDTO> getUserList(int pg);

	public int getTotal();
	

}
