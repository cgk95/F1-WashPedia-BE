package com.kernel360.member.repository;

import com.kernel360.member.entity.Member;
import jakarta.persistence.Id;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface MemberRepository extends JpaRepository<Member, Id> {

    Member findOneByIdAndPassword(String id, String password);

    Member findOneById(String id);

    @Query("SELECT m FROM Member m WHERE m.id = :id AND m.accountType = 'PLATFORM'")
    Member findOneByIdForAccountTypeByPlatform(@Param("id") String id);

    Member findOneByEmail(String email);


    @Query("SELECT m FROM Member m WHERE m.email = :email AND m.accountType = 'PLATFORM'")
    Member findOneByEmailForAccountTypeByPlatform(@Param("email") String email);
}
