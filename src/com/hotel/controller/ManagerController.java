package com.hotel.controller;

import java.util.List;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.entity.CheckIn;
import com.hotel.service.CheckInService;

@Controller
public class ManagerController {
	
	@Autowired
	private CheckInService checkInService;

	@RequestMapping(value="/business")
	public String index(Model model){
		String type = "所有";
		List<CheckIn> checkinlist = checkInService.selectAllCheckIn(type);
		String amountall = checkInService.selectAmount(type);
		model.addAttribute("checkinlist",checkinlist);
		model.addAttribute("amountall", amountall);
		return "/manage/business";
	}
	
	@RequestMapping(value="/business/typechange",method=RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String shouyi(String type){
		JSONObject json = new JSONObject();
		List<CheckIn> checkinlist = null;
		checkinlist = checkInService.selectAllCheckIn(type);
		String amountall = checkInService.selectAmount(type);
		if(checkinlist.size()>0&&checkinlist!=null){
			json.put("success", true);
			json.put("data", checkinlist);
			json.put("amountall", amountall);
		}else{
			json.put("success", false);
		}
		return json.toString();
	}
}












