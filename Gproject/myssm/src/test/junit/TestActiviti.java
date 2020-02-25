package test.junit;

import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.activiti.engine.test.Deployment;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestActiviti {

    ApplicationContext ioc = new ClassPathXmlApplicationContext("spring-flow.xml");
    ProcessEngine processEngine = (ProcessEngine)ioc.getBean("processEngine");


    //8.流程变量
    //如果存在流程变量,那么,在启动流程实例时,要给流程变量赋值.否则,启动流程实例会报错.
    //org.activiti.engine.ActivitiException: Unknown property used in expression: ${tl}
    @Test
    public void test08(){
        ProcessDefinition processDefinition = processEngine.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();

        RuntimeService runtimeService = processEngine.getRuntimeService();


        Map<String,Object> varibales = new HashMap<String,Object>();
        varibales.put("tl", "zhangsan");
        varibales.put("pm", "lisi");


        ProcessInstance processInstance = runtimeService.startProcessInstanceById(processDefinition.getId(),varibales);
        System.out.println("processInstance="+processInstance);
    }
    //7.领取任务
    @Test
    public void test07(){
        ProcessDefinition processDefinition = processEngine.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();

        TaskService taskService = processEngine.getTaskService();
        TaskQuery createTaskQuery = taskService.createTaskQuery();
        List<Task> list = createTaskQuery.taskCandidateGroup("tl").list();

        long count = createTaskQuery.taskAssignee("zhangsan").count();
        System.out.println("zhangsan领取前的任务数量:"+count);

        for (Task task : list) {
            System.out.println("id="+task.getId());
            System.out.println("name="+task.getName());
            taskService.claim(task.getId(), "zhangsan");
        }
        createTaskQuery = taskService.createTaskQuery();
        count = createTaskQuery.taskAssignee("zhangsan").count();
        System.out.println("zhangsan领取后的任务数量:"+count);


    }
    //历史数据查询
    @Test
    public void test06(){
        ProcessDefinition processDefinition = processEngine.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();

        HistoryService historyService = processEngine.getHistoryService();

        HistoricProcessInstanceQuery historicProcessInstanceQuery = historyService.createHistoricProcessInstanceQuery();

        HistoricProcessInstance historicProcessInstance = historicProcessInstanceQuery.processInstanceId("301").finished().singleResult();
        System.out.println("historicProcessInstance="+historicProcessInstance);

    }
    //查询流程实例的任务
    @Test
    public void test05(){
        ProcessDefinition processDefinition = processEngine.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();
        TaskService taskService = processEngine.getTaskService();
        TaskQuery createTaskQuery = taskService.createTaskQuery();
        List<Task> list1 = createTaskQuery.taskAssignee("zhangsan").list();
        List<Task> list2 = createTaskQuery.taskAssignee("lisi").list();
        System.out.println("zhangsan: =");
        for(Task task:list1){
            System.out.println("任务名字="+task.getName());
            System.out.println("任务id="+task.getId());
            //张三完成任务
            taskService.complete(task.getId());
        }
        list2 = createTaskQuery.taskAssignee("lisi").list();
        System.out.println("lisi: =");
        for(Task task:list2){
            System.out.println("任务名字="+task.getName());
            System.out.println("任务id="+task.getId());
            taskService.complete(task.getId());
        }
    }

    //启动流程实例
    @Test
    public void test04(){
        ProcessDefinition processDefinition = processEngine.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();
        RuntimeService runtimeService = processEngine.getRuntimeService();
        ProcessInstance processInstance = runtimeService.startProcessInstanceById(processDefinition.getId());
        System.out.println("processinstance="+processInstance);

    }
    //查询部署流程
    @Test
    public void test03(){
        System.out.println("processEngine="+processEngine);
        RepositoryService repositoryService = processEngine.getRepositoryService();
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        List<ProcessDefinition> list = processDefinitionQuery.list();//查询所有的流程定义
//        System.out.println("processDefinitionQuery="+processDefinitionQuery);
        for(ProcessDefinition processDefinition:list){
            System.out.println("id="+processDefinition.getId());
            System.out.println("key="+processDefinition.getKey());
            System.out.println("neme="+processDefinition.getName());
            System.out.println("version="+processDefinition.getVersion());
            System.out.println("--------------------------------");
        }
        long count = processDefinitionQuery.count();//查询流程定义的记录数
        System.out.println("count="+count);

        ProcessDefinition processDefinition = processDefinitionQuery.latestVersion().singleResult();//查询最后一次部署的流程定义
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println("id="+processDefinition.getId());
        System.out.println("key="+processDefinition.getKey());
        System.out.println("neme="+processDefinition.getName());
        System.out.println("version="+processDefinition.getVersion());
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");


        //排序查询流程定义，分页查询流程定义
        ProcessDefinitionQuery definitionQuery = processDefinitionQuery.orderByProcessDefinitionVersion().desc();
        List<ProcessDefinition>listPage = definitionQuery.listPage(0,2);
        for(ProcessDefinition processDefinition2:listPage){
            System.out.println("id="+processDefinition2.getId());
            System.out.println("key="+processDefinition2.getKey());
            System.out.println("neme="+processDefinition2.getName());
            System.out.println("version="+processDefinition2.getVersion());
            System.out.println("***************************");
        }

        //根据流程定义的key查询流程定义对象
        ProcessDefinition processDefinition2 = processDefinitionQuery.processDefinitionKey("myProcess_1").latestVersion().singleResult();
        System.out.println("id="+processDefinition2.getId());
        System.out.println("key="+processDefinition2.getKey());
        System.out.println("neme="+processDefinition2.getName());
        System.out.println("version="+processDefinition2.getVersion());
        System.out.println("！！！！！！！！！！！！！！！！！！！！");

    }
    @Test
    public void test02(){
        System.out.println("processEngine="+processEngine);
        RepositoryService repositoryService = processEngine.getRepositoryService();
        org.activiti.engine.repository.Deployment deployment = repositoryService.createDeployment().addClasspathResource("diagrams/MyProcess4.bpmn").deploy();
        System.out.println("deploy="+deployment);
    }
    //建表
    @Test
    public void test01(){
        System.out.println("processEngine="+processEngine);
    }
}
