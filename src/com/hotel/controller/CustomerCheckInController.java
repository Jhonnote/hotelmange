package com.hotel.controller;

import java.util.List;


import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.entity.CheckIn;
import com.hotel.entity.Room;
import com.hotel.service.CheckInService;
import com.hotel.service.RoomService;

@Controller
public class CustomerCheckInController {
	
	@Autowired
	private CheckInService checkInService;
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value="/check_in",method=RequestMethod.GET)
	public String index(Model model){
		List<CheckIn> checkinlist = checkInService.selectStaffAll("入住");
		model.addAttribute("checkin", checkinlist);
		return "/staff/checkIn";
	}
	
	@RequestMapping(value="/checkinroom/{id}",method=RequestMethod.GET)
	public String checkinroom(@PathVariable(value="id") int id,Model model){
		checkInService.checkinroom(id);
		return index1(model);
	}
	
	@RequestMapping(value="/checkinbilling/{id}",method=RequestMethod.GET)
	public String checkinbilling(@PathVariable(value="id") int id,Model model){
		checkInService.checkinbilling(id);
		return index(model);
	}
	
	@RequestMapping(value="/checkinadd",method=RequestMethod.GET)
	public String add(Model model){
		List<Room> roomlist = roomService.selectRoomByAll();
		model.addAttribute("room", roomlist);
		return "/staff/checkInadd";
	}
	
	@RequestMapping(value="/checkinadd",method=RequestMethod.POST)
	public String add(CheckIn checkin,Model model){
		boolean result = checkInService.insertCheckIn(checkin,"入住");
		if(result){
			model.addAttribute("msg", "添加成功！");
		}else{
			model.addAttribute("msg", "添加成功！");
		}
		return "/staff/checkInadd";
	}
	
	@RequestMapping(value="/reserve",method=RequestMethod.GET)
	public String index1(Model model){
		List<CheckIn> checkinlist = checkInService.selectStaffAll("预定");
		model.addAttribute("checkin", checkinlist);
		return "/staff/reserve";
	}
	
	@RequestMapping(value="/reserveedit/{id}",method=RequestMethod.GET)
	public String edit1(@PathVariable(value="id") int id,Model model){
		CheckIn checkin = checkInService.selectCheckInById(id);
		Room room = roomService.seleRoomById(checkin.getRoom_id());
//		List<Room> roomlist = roomService.selectRoomByAll();
		model.addAttribute("room", room);
		if(checkin!=null){
			model.addAttribute("checkin", checkin);
		}
		return "/staff/reserveedit";
	}
	
	@RequestMapping(value="/reserveedit",method=RequestMethod.POST)
	public String edit1(CheckIn checkin,Model model){
		boolean result = checkInService.updateCheckIn(checkin);
		if(result){
			model.addAttribute("msg", "添加成功！");
		}else{
			model.addAttribute("msg", "操作失败！");
		}
		return "/staff/reserveedit";
	}
	
	@RequestMapping(value="/reserveadd",method=RequestMethod.GET)
	public String add1(Model model){
		List<Room> roomlist = roomService.selectRoomByAll();
		model.addAttribute("room", roomlist);
		return "/staff/reserveadd";
	}
	@RequestMapping(value="/reserveadd",method=RequestMethod.POST)
	public String add1(CheckIn checkin,Model model){
		boolean result = checkInService.insertCheckIn(checkin,"预定");
		if(result){
			model.addAttribute("msg", "添加成功！");
		}else{
			model.addAttribute("msg", "操作失败！");
		}
		return "/staff/reserveadd";
	}
	
	@RequestMapping(value="/reserve/query",method=RequestMethod.POST)
	@ResponseBody
	public String query(String type){
		JSONObject json = new JSONObject();
		List<Room> roomlist = roomService.selectRoomByType(type);
		json.put("room", roomlist);
		return json.toString();
	}
	
	@RequestMapping(value="/billing")
	public String billingindex(Model model){
		List<CheckIn> checkinlist = checkInService.selectStaffAll("结帐");
		model.addAttribute("checkin", checkinlist);
		return "/staff/billing";
	}
}
