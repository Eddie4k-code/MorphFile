variable "task_definition" {
    description = "The task definition configuration for the ECS service. This should include the container definitions, CPU, memory, and other task-level settings."
    type        = any
    default     = {}
}