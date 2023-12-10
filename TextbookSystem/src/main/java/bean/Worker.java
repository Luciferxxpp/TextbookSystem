package bean;

import java.util.Objects;

public class Worker {
    String workerId;
    String workerName;
    String password;
    String gender;

    public Worker() {
    }

    public Worker(String workerId, String workerName, String password, String gender) {
        this.workerId = workerId;
        this.workerName = workerName;
        this.password = password;
        this.gender = gender;
    }

    public String getWorkerId() {
        return workerId;
    }

    public void setWorkerId(String workerId) {
        this.workerId = workerId;
    }

    public String getWorkerName() {
        return workerName;
    }

    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Worker worker = (Worker) o;
        return Objects.equals(workerId, worker.workerId) && Objects.equals(workerName, worker.workerName) && Objects.equals(password, worker.password) && Objects.equals(gender, worker.gender);
    }

    @Override
    public int hashCode() {
        return Objects.hash(workerId, workerName, password, gender);
    }

    @Override
    public String toString() {
        return "Worker{" +
                "workerId=" + workerId +
                ", workerName='" + workerName + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                '}';
    }
}
