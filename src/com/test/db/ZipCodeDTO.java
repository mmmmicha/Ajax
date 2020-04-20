/*========================
 * 	ZipCodeDTO.java
 * =======================*/

package com.test.db;

public class ZipCodeDTO
{
	// 주요 속성 구성
	private String zipcode;
	private String address;
	
	// 기본 생성자 추가 정의
	public ZipCodeDTO()
	{
		// 생성자 내 생성자 호출.. 이 때 제일 먼저 등장하도록 해야함
		this("", "");
	}
	
	// 생성자 추가 정의
	public ZipCodeDTO(String zipcode, String address)
	{
		this.zipcode = zipcode;
		this.address = address;
	}
	
	// getter / setter 구성
	public String getZipcode()
	{
		return zipcode;
	}
	public void setZipcode(String zipcode)
	{
		this.zipcode = zipcode;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	
	
	
	
	
}
