function sampSetLicensePlateText(id, text) -- создаём функцию с параметрами: ID автомобиля (SAMPID), text (текст номерного знака)
    if isCharInAnyCar(PLAYER_PED) then -- если игрок сидит в автомобиле, то
    local veh = storeCarCharIsInNoSave(PLAYER_PED) -- получаем handle транспорта, в котором сидит игрок
    local result, id = sampGetVehicleIdByCarHandle(veh) -- получаем SAMPID транспорта по handle
    local vehpool = sampGetVehiclePoolPtr() -- возвращаем указатель на пул т/с
    if getStructElement(vehpool, 0x3074 + id * 4, 1) == 1 then -- читаем значение целого оффсета из памяти по адресу
        local this = ffi.cast('void*', getStructElement(vehpool, 0x1134 + id * 4, 4)) -- кастуем целое значение
        ffi.cast('void(__thiscall*)(void*this, const char* text)', sampGetBase() + 0xB1BF0)(this, ffi.cast('char*', text)) -- вызываем адрес 0xB1BF0 и меняем текст автомобиля
    end
end
