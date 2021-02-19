package com.untoon.member.model.vo;

import org.springframework.stereotype.Component;

//Controller에서 Autowiredfh Bean등록 해주기 위해 Component 어노테이션 첨가
@Component("diceObj")
public class Dice {
	
	private String dice; //랜덤숫자
	private String btn; // 버튼 클릭 확인
	
	public Dice() {}

	public Dice(String dice, String btn) {
		super();
		this.dice = dice;
		this.btn = btn;
	}

	public String getDice() {
		return dice;
	}

	public void setDice(String dice) {
		this.dice = dice;
	}

	public String getBtn() {
		return btn;
	}

	public void setBtn(String btn) {
		this.btn = btn;
	}

	@Override
	public String toString() {
		return "Dice [dice=" + dice + ", btn=" + btn + "]";
	}
	
	

}
