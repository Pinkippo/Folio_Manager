package com.spring.folio_back.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;

@Getter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "comment")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cid;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "uid")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bid")
    private Board board;

    @Temporal(TemporalType.DATE)
    @CreationTimestamp
    private Date writeDate;

    @Column(name="content", length = 100)
    private String content;

    public Comment(User user, Board board, String content) {
        this.user = user;
        this.board = board;
        this.content = content;
    }
}
