package com.spring.folio_back.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;
import java.util.List;

/**
 * 요구사항 게시판 엔티티
 */
@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bid")
    private Long bid;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "uid")
    private User user;

    @Temporal(TemporalType.DATE)
    @CreationTimestamp
    private Date writeDate;

    @Column(name="title")
    private String title;

    @Column(name="content", length = 254)
    private String content;

    @JsonIgnore
    @BatchSize(size = 500)
    @OneToMany(mappedBy = "board", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments;

    public Board(User user, String title, String content) {
        this.user = user;
        this.title = title;
        this.content = content;
    }

}
