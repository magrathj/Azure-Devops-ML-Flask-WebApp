from locust import HttpUser, TaskSet, task, between


class UserBBehavior(TaskSet):
    def on_start(self):
        self.warmup()

    def warmup(self):
        self.client.get("/")

    @task(1)
    def volatile(self):
        self.client.post("/predict", json={  
                                            "CHAS":{  
                                                "0":0
                                            },
                                            "RM":{  
                                                "0":6.575
                                            },
                                            "TAX":{  
                                                "0":296.0
                                            },
                                            "PTRATIO":{  
                                                "0":15.3
                                            },
                                            "B":{  
                                                "0":396.9
                                            },
                                            "LSTAT":{  
                                                "0":4.98
                                            }
                                            })


class AdminUser(HttpUser):
    tasks = {UserBBehavior}
    wait_time = between(5, 15)