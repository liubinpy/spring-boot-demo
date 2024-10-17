import xml.etree.ElementTree as ET

def get_jar_file_path():
    pom_file = "pom.xml"  # Maven项目的pom.xml文件路径

    # 解析pom.xml文件
    tree = ET.parse(pom_file)
    root = tree.getroot()

    # 查找构建输出目录路径
    build_plugins = root.findall("./build/plugins/plugin")

    for plugin in build_plugins:
        artifact_id = plugin.find("artifactId").text
        if artifact_id == "spring-boot-maven-plugin":
            configuration = plugin.find("configuration")
            if configuration is not None:
                output_directory = configuration.find("outputDirectory")
                if output_directory is not None:
                    jar_file_path = output_directory.text + "/" + root.find("build.finalName").text + ".jar"
                    return jar_file_path

    return None

# 调用函数获取JAR文件路径
jar_path = get_jar_file_path()

if jar_path is not None:
    print("JAR文件路径:", jar_path)
else:
    print("未找到JAR文件路径")

