package main

import (
	"errors"
	"fmt"
	uuid2 "github.com/google/uuid"
)

type Task = map[string]string

type TaskList struct {
	tasks []Task
}

func (tl *TaskList) Add(task string) {
	uuid := uuid2.New().String()
	newTask := Task{
		uuid: task,
	}
	tl.tasks = append(tl.tasks, newTask)

}

func (tl *TaskList) Delete(uuid string) error {
	for i, task := range tl.tasks {
		if uuid == task[uuid] {
			delete(tl.tasks[i], task[uuid])
			return nil
		}
	}
	return errors.New("Task not found with uuid " + uuid)

}

func (tl *TaskList) Get() []Task {
	return tl.tasks

}

func (tl *TaskList) Update(uuid string, newTask string) error {
	for _, task := range tl.tasks {
		if uuid == task[uuid] {
			task[uuid] = newTask
			return nil
		}
	}
	return errors.New("Task not found with uuid " + uuid)

}

func main() {
	tasks := TaskList{}
	tasks.Add("jugar videojuegos")
	tasks.Add("dance")
	tasks.Add("sleep")
	tasksAll := tasks.Get()
	fmt.Println(tasksAll)
	fmt.Println(len(tasksAll))

}

