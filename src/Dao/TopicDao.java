package Dao;

import Bean.Topic;

import java.util.List;

public interface TopicDao {
    Integer getTotalCountByType(String type);

    List<Topic> getTopicByType(int start, Integer limit, String type);

    Integer findTopicCountByUser(String uid);

    List<Topic> findTopicByUser(String userId);

    boolean addTopic(Topic topic);

    List<String> findTopicTypeList();

    Topic findTopicById(Integer tid);

    List<Topic> findTopicByKeyword(String keyword);

    Integer getTotalCountByTitle(String keyword);

    List<Topic> getTopicByTitle(int start, Integer limit, String keyword);
}
