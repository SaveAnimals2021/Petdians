package org.petdians.common.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.petdians.batch.config.AnimalJobConfig;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.repository.support.JobRepositoryFactoryBean;
import org.springframework.batch.support.transaction.ResourcelessTransactionManager;
import org.springframework.batch.test.JobLauncherTestUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Log4j
@Configuration
@EnableTransactionManagement
@Import({AnimalJobConfig.class})
public class CommonConfig {

    @Bean
    @Primary
    public DataSource dataSource() {
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
        hikariConfig.setJdbcUrl("jdbc:mysql://112.169.196.210:3309/saveanimals?serverTimezone=UTC");
        hikariConfig.setUsername("saproject");
        hikariConfig.setPassword("saveanimals");
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        return dataSource;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(this.dataSource());


        return sqlSessionFactory.getObject();
    }

    @Bean
    public DataSourceTransactionManager txManager() {
        return new DataSourceTransactionManager(this.dataSource());
    }

    @Bean
    public DataSource batchEmbeddedDatasource() {
        EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();

        // memory로 만드는 DB
        return builder.setType(EmbeddedDatabaseType.H2)
                .addScript("classpath:org/springframework/batch/core/schema-drop-h2.sql")
                .addScript("classpath:org/springframework/batch/core/schema-h2.sql")
                .build();
    }

    @Bean
    public JobRepository jobRepository() throws Exception {
        JobRepositoryFactoryBean jrfb = new JobRepositoryFactoryBean();
        jrfb.setDataSource(batchEmbeddedDatasource());
        jrfb.setTransactionManager(rtxManager());
        return jrfb.getObject();

    }

    @Bean
    public JobLauncher jobLauncher() throws Exception {
        SimpleJobLauncher launcher = new SimpleJobLauncher();
        launcher.setJobRepository(jobRepository());
        return launcher;
    }

    @Bean
    public ResourcelessTransactionManager rtxManager() throws Exception {
        return new ResourcelessTransactionManager();
    }

    @Bean
    public JobLauncherTestUtils jobLauncherTestUtils() throws Exception {
        JobLauncherTestUtils utils = new JobLauncherTestUtils();

        return utils;
    }

}
