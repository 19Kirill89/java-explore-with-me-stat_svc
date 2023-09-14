package ru.practicum.server.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;
import org.springframework.format.annotation.DateTimeFormat;
import ru.practicum.server.constants.Pattern;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "statistics")
@FieldDefaults(level = AccessLevel.PRIVATE)
public class EndpointHit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;
    @Column(nullable = false)
     String app;
    @Column(nullable = false)
     String uri;
    @Column(nullable = false)
     String ip;
    @Column(nullable = false)
    @DateTimeFormat(pattern = Pattern.DATE)
     LocalDateTime timestamp;
}
