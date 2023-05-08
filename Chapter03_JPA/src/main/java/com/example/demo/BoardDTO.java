package com.example.demo;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Entity //해당 class는 Entity 이다.
@Table(name="board")
@Data
@SequenceGenerator(name = "BOARD_SEQ_GENETRATOR",  //시퀀스 제너레이터 이름
				   sequenceName = "BOARD_SEQ",  //시퀀스 이름
				   initialValue = 1,  //시작값
				   allocationSize = 1  //메모리를 통해 할당할 범위 사이즈
				   )
public class BoardDTO {
	
	@Id // pk 지정
	@Column(name="seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,//사용할 전략을 시퀀스로  선택
					generator = "BOARD_SEQ_GENETRATOR" //식별자 생성기를 설정해놓은  BOARD_SEQ_GENETRATOR 으로 설정 
					)
	private int seq;
	
	
	@Column(name="id", nullable = false, unique = true, length = 30)
	private String id;
	
	@Column(name="name", nullable = false, length = 30)
	private String name;
	
	@Column(name="subject")
	private String subject;
	
	@Column(name="content")
	private String content;
	
	@CreationTimestamp // Entity가 생성되는 시점의 시간 등록
	private Timestamp logtime;
	
	
}
