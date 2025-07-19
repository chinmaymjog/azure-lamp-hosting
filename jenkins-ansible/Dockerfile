FROM ubuntu

# Install base packages
RUN apt update && \
    apt install -y wget sudo mysql-client software-properties-common fontconfig openjdk-17-jre less python3 python3-pip python3-venv vim && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    wget -q -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
    tee /etc/apt/sources.list.d/jenkins.list > /dev/null && \
    apt update -qq && \
    apt install -y -qq ansible jenkins && \
    echo "jenkins ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/jenkins && \
    useradd -m webadmin && \
    echo "webadmin ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/webadmin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create venv and install Azure SDKs
RUN python3 -m venv /opt/ansible-venv && \
    /opt/ansible-venv/bin/pip install --upgrade pip && \
    /opt/ansible-venv/bin/pip install azure-identity azure-keyvault-secrets

# Optional: make sure Ansible uses venv Python
ENV PATH="/opt/ansible-venv/bin:$PATH"

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
