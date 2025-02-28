// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// Default values
public const DEFAULT_TIME_TO_LIVE = 300; // In seconds
public const DEFAULT_MAX_MESSAGE_COUNT = 1;
public const DEFAULT_SERVER_WAIT_TIME = 300; // In seconds
public const DEFAULT_MESSAGE_LOCK_TOKEN = "00000000-0000-0000-0000-000000000000";
public const EMPTY_STRING = "";

// Message content types
public const TEXT = "text/plain";
public const JSON = "application/json";
public const XML = "application/xml";
public const BYTE_ARRAY = "application/octet-stream";

// Azure Service Bus Client API Record Types.

# Configurations used to create an `asb:Connection`.
# 
# + connectionString - Service bus connection string with Shared Access Signatures  
#                      ConnectionString format: 
#                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
#                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
#                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
#                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN 
# + entityConfig -  This field holds the configuration details of either a topic or a queue. The type of the entity is 
#                   determined by the entityType field. The actual configuration details are stored in either a 
#                   TopicSubsConfig or a QueueConfig record  
# + receiveMode - This field holds the receive modes(RECEIVE_AND_DELETE/PEEK_LOCK) for the connection. The receive mode determines how messages are 
# retrieved from the entity. The default value is PEEK_LOCK  
# + maxAutoLockRenewDuration - Max lock renewal duration under PEEK_LOCK mode. Setting to 0 disables auto-renewal (default). 
#                              For RECEIVE_AND_DELETE mode, auto-renewal is disabled.
@display {label: "Receiver Connection Config"}
public type ASBServiceReceiverConfig record {
    @display {label: "ConnectionString"}
    string connectionString;
    @display {label: "Entity Configuration"}
    TopicSubsConfig|QueueConfig entityConfig;
    @display {label: "Receive Mode"}
    ReceiveMode receiveMode = PEEK_LOCK;
    @display {label: "Max Auto Lock Renew Duration"}
    int maxAutoLockRenewDuration = 0;
};

# This record holds the configuration details of a topic and its associated subscription in Azure Service Bus
#
# + topicName - A string field that holds the name of the topic  
# + subscriptionName - A string field that holds the name of the subscription associated with the topic
@display {label: "Topic/Subscriptions Configurations"}
public  type TopicSubsConfig record {
   @display {label: "Topic Name"}
   string topicName;
   @display {label: "Subscription Name"}
   string subscriptionName; 
};

# This record holds the configuration details of a queue in Azure Service Bus
#
# + queueName - A string field that holds the name of the queue
@display {label: "Queue Configurations"}
public  type QueueConfig record {
   @display {label: "Queue Name"}
   string queueName;
};

# Holds the configuration details needed to create a sender connection to Azure Service Bus
#
# + entityType - An enumeration value of type EntityType, which specifies whether the connection is for a topic or a queue. 
#                The valid values are TOPIC and QUEUE  
# + topicOrQueueName - A string field that holds the name of the topic or queue
# + connectionString - A string field that holds the Service Bus connection string with Shared Access Signatures.
@display {label: "Sender Connection Config"}
public type ASBServiceSenderConfig record {
    @display {label: "EntityType"}
    EntityType entityType;
    @display {label: "Queue/Topic Name"}
    string topicOrQueueName;
    @display {label: "ConnectionString"}
    string connectionString;
};

# Represents Custom configurations for the ASB connector
#
# + logLevel - Enables the connector debug log prints (log4j log levels), default: OFF
public  type CustomConfiguration record {
    @display {label: "Log Level"}
    LogLevel logLevel = OFF; 
};

//Message entity types
public enum EntityType {
    @display {label: "Queue"}
    QUEUE = "queue",
    @display {label: "Topic"}
    TOPIC = "topic"
}

//Message receiver modes
public enum ReceiveMode {
    @display {label: "RECEIVE AND DELETE"}
    RECEIVE_AND_DELETE = "RECEIVEANDDELETE",
    @display {label: "PEEK LOCK"}
    PEEK_LOCK = "PEEKLOCK"
}

//Log_levels
public enum LogLevel {
    @display {label: "DEBUG"}
    DEBUG,
    @display {label: "INFO"}
    INFO,
    @display {label: "WARNING"}
    WARNING,
    @display {label: "ERROR"}
    ERROR,
    @display {label: "FATAL"}
    FATAL,
    @display {label: "OFF"}
    OFF
}
