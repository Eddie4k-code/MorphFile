output "task_definition_arn" {
    description = "The ARN of the task definition."
    value       =  {
        for task in module.ecs.task_definition : 
        task.task_definition_arn => task.task_definition_arn
    }
}