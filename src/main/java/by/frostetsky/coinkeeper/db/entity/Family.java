package by.frostetsky.coinkeeper.db.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "families")
public class Family implements BaseEntity<Long>{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "family_id")
    private Long id;
    @Column(name = "family_name")
    private String name;
    @Column(name = "created_at")
    private Timestamp createdAt;

    @OneToMany(mappedBy = "family")
    @Builder.Default
    private List<User> users = new ArrayList<>();
}
