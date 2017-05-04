package com.hotel.mapper;

import java.util.List;

import com.hotel.entity.Room;

public interface RoomMapper {

	List<Room> selectRoomByAll();

	List<Room> selectRoomByType(String type);

	void updateRoom(Room room);

	Room seleRoomById(int room_id);

}
