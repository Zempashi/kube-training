from locust import HttpLocust, TaskSet, task

class GetRootTask(TaskSet):
    @task
    def get_root(self):
        self.client.get("/")

class SiteWarmer(HttpLocust):
    task_set = GetRootTask
    min_wait = 0
    max_wait = 0
