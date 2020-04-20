/*======================
 * 	WordDTO.java
 *===================== */

package com.test.db;

public class WordDTO
{
	private String word;

	// 기본 형태 생성자 추가
	public WordDTO()
	{
		this("");
	}
	
	// 사용자 정의 생성자
	public WordDTO(String word)
	{
		this.word = word;
	}
	
	// getter / setter 구성
	public String getWord()
	{
		return word;
	}

	public void setWord(String word)
	{
		this.word = word;
	}
}
