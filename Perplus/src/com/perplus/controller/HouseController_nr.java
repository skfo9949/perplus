package com.perplus.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.perplus.house.service.HouseService_nr;
import com.perplus.house.vo.HousePictureVo;
import com.perplus.house.vo.HouseVo;
import com.perplus.member.service.MemberService;
import com.perplus.member.vo.HouseCommentVo;
import com.perplus.util.TextUtil;


@Controller
@RequestMapping("house")
public class HouseController_nr {
	
	@Autowired
	private HouseService_nr service;
	@Autowired
	private MemberService memberService;
	
	/******************하우스 상세 페이지 조회*****************/
	@RequestMapping("/houseDetail")
	public String getHouse(@RequestParam int houseSerial, ModelMap map,@RequestParam(defaultValue="1") int page){
		System.out.println(houseSerial);
		HouseVo house = service.selectHouseForDetailPage(houseSerial);
		//List<HousePictureVo> picture= service.selectHousePictureForDetailPage(houseSerial);
		Map<String,Object> comment = memberService.selectHouseCommentBySerial(houseSerial,page);
		System.out.println(comment.get("commentList"));
		//house.setHousePicture(picture);
		map.put("house", house);
	//	map.put("picture",picture);
		map.put("comment", comment);
		System.out.println(house);
		return "housedetailspage.housetiles";
	}
	
	/******************하우스 상세 페이지 삭제*****************/
	@RequestMapping("/removeHouse")
	public String removeHouse(@RequestParam int houseSerial){
		System.out.println(houseSerial);
		service.removeHouse(houseSerial);
		return "redirect:/main.do";
	}
	/******************하우스 코멘트 등록*****************/
	@RequestMapping("/registerHouseComment")
	public String registerHouseComment(@ModelAttribute HouseCommentVo houseComment,ModelMap map){
		houseComment.setCommentTime(new Date());
		houseComment.setCommentSerial(1);
		houseComment.setCommentContent(TextUtil.textToHtml(houseComment.getCommentContent()));
		memberService.insertHouseComment(houseComment);
		
		return "redirect:/house/houseDetail.do?&houseSerial="+houseComment.getHouseSerial();
	}
	/******************하우스 코멘트 삭제*****************/
	@RequestMapping("/removeHouseComment")
	public String removeHouseComment(@RequestParam int commentSerial,@RequestParam int houseSerial){
		System.out.println(commentSerial);
		memberService.deleteHouseComment(commentSerial);	
		return "redirect:/house/houseDetail.do?&houseSerial="+houseSerial;
	}

}	
















