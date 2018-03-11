package Dao;

import Bean.Topic;

import java.util.List;

public interface TopicDao {
    Integer getTotalCountByType(String type);

    List<Topic> getTopicByType(int start, Integer limit, String type);
}
