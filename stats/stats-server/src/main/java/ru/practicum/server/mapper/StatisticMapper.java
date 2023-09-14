package ru.practicum.server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.practicum.dto.CreateEndpointHitDto;
import ru.practicum.dto.ResponseEndpointHitDto;
import ru.practicum.server.model.EndpointHit;
import ru.practicum.server.constants.Pattern;

@Mapper(componentModel = "spring")
public interface StatisticMapper {

    @Mapping(source = "timestamp", target = "timestamp", dateFormat = Pattern.DATE)
    EndpointHit mapToEndpointHit(CreateEndpointHitDto createEndpointHitDto);

    @Mapping(source = "timestamp", target = "timestamp", dateFormat = Pattern.DATE)
    ResponseEndpointHitDto mapToResponseEndpointHitDto(EndpointHit endpointHit);
}
