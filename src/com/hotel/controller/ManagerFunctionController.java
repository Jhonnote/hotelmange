package com.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.entity.CheckIn;
import com.hotel.entity.Customer;
import com.hotel.entity.Management;
import com.hotel.entity.Room;
import com.hotel.entity.RoomType;
import com.hotel.service.ManagerService;

@Controller
public class ManagerFunctionController {
	
	@Autowired
	private ManagerService managerService;

	// 查看所有用户信息
	@RequestMapping(value = "/customerinfo",method=RequestMethod.GET)
	public String customerInfo(Model model) {

		List<Customer> list = managerService.selectAllCustomer();
		model.addAttribute("lists", list);
		return "/manage/customerinfo";
	}

	// 查看所有房间类型信息
	@RequestMapping(value="/kefangtype")
	public String roomType(Model model){
		List<RoomType> list = managerService.findRoomType();
		model.addAttribute("list", list);
		return "/manage/roomtype";
	}
	
	//增加房间类型
	@RequestMapping(value="/roomTypeAdd",method=RequestMethod.GET)
	public String roomTypeAdd(){
		return "/manage/roomtypeadd";
	}
	
	//房间类型是否添加成功信息显示
	@RequestMapping(value="/roomTypeAdd",method=RequestMethod.POST)
	public String roomTypeAdd(Model model, RoomType roomType){
		boolean result = managerService.addRoomType(roomType);
		if(result){
			model.addAttribute("msg", "添加成功！");
		} else {
			model.addAttribute("msg", "添加失败！");
		}
		return "/manage/roomtypeadd";
	}
	
	//根据id删除房间类型
	@RequestMapping(value="/roomTypeDelete")
	public String roomTypeDelete(int id){
		managerService.deleteRoomTypeById(id);
		return "redirect:kefangtype";
	}
	
	// 查看所有房间信息
	@RequestMapping(value = "/kefangshezhi")
	public String roomInfo(Model model) {
		List<Room> list = managerService.findRoomInfo();
		model.addAttribute("lists", list);
		return "/manage/roominfo";
	}

	// 房间添加
	@RequestMapping(value = "/roomAdd", method=RequestMethod.GET)
	public String roomAdd(Model model) {
		List<Room> listrm = managerService.findRoomInfo();
		model.addAttribute("listrm", listrm);
		return "/manage/roomadd";
	}
	
	//房间添加成功或失败显示
	@RequestMapping(value="/roomAdd",method=RequestMethod.POST)
	public String roomAdd(Room room, Model model){
		boolean result = managerService.insertRoomType(room);
		if(result){
			model.addAttribute("msg", "添加成功！");
		} else {
			model.addAttribute("msg", "添加失败！");
		}
		return "/manage/roomadd";
	}
	
	//根据id删除房间
	@RequestMapping(value="/roomDelete")
	public String deleteRoomById(int id){
		managerService.deleteRoomById(id);
		return "redirect:kefangshezhi";
	}
	
	//修改房间信息
	@RequestMapping(value="/roomEdit",method=RequestMethod.GET)
	public String roomEdit(int id, Model model){
		Room room = managerService.findRoomInfoById(id);
		model.addAttribute("room", room);
		return "/manage/roomedit";
	}
	
	//修改房间信息完成后，显示是否修改成功信息，若成功则更新数据库数据
	@RequestMapping(value="/roomEdit",method=RequestMethod.POST)
	public String roomEditShow(Room room, Model model){
		boolean result = managerService.updateRoomInfoById(room);
		if(result){
			model.addAttribute("msg", "修改成功！");
		} else {
			model.addAttribute("msg", "修改失败！");
		}
		return "/manage/roomedit";
	}
	
	//查看所有员工信息
	@RequestMapping(value="/yuangongxinxi")
	public String empInfo(Model model){
		List<Management> list = managerService.findAllEmp();
		model.addAttribute("list", list);
		return "/manage/empinfo";
	}
	
	//根据id删除员工信息
	@RequestMapping(value="/empDelete")
	public String empDelete(int id){
		managerService.deleteEmpById(id);
		return "redirect:/yuangongxinxi";
	}
	
	//添加员工
	@RequestMapping(value="/empAdd",method=RequestMethod.GET)
	public String empAdd(){
		return "/manage/empadd";
	}
	
	//添加员工完成后，显示是否添加成功信息，若成功则更新数据库数据
	@RequestMapping(value="/empAdd",method=RequestMethod.POST)
	public String empAdd(Model model,Management management){
		boolean result = managerService.addEmp(management);
		if(result) {
			model.addAttribute("msg", "添加成功！");
		} else {
			model.addAttribute("msg", "添加失败！");
		}
		return "/manage/empadd";
	}
	
	//修改员工信息
	@RequestMapping(value="/empEdit",method=RequestMethod.GET)
	public String empEditById(Model model, int id){
		Management management = managerService.findEmpById(id);
		model.addAttribute("management", management);
		return "/manage/empedit";
	}
	
	//修改员工信息后,显示是否修改成功信息，若成功则更新数据库数据
	@RequestMapping(value="/empEdit",method=RequestMethod.POST)
	public String empEditShow(Model model, Management management){
		boolean result = managerService.updateEmpById(management);
		if(result){
			model.addAttribute("msg", "修改成功！");
		} else {
			model.addAttribute("msg", "修改失败！");
		}
		return "/manage/empedit";
	}
}





























