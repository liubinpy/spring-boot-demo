build:
	mvn clean package

clean:
	rm -rf ./target 

run:
	java -jar ./target/demo-0.0.1-SNAPSHOT.jar

image:
	docker build -t ccr.ccs.tencentyun.com/freemuddockernamespace/springboot-demo:v1.1 .

crun:
	docker run --rm -it ccr.ccs.tencentyun.com/freemuddockernamespace/springboot-demo:v1.1

deploy:
	docker push ccr.ccs.tencentyun.com/freemuddockernamespace/springboot-demo:v1.1 && kubectl apply -f ./manifest

apply:
	kubectl apply -f ./manifest

delete:
	kubectl delete -f ./manifest