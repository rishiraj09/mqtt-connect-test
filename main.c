#include <stdio.h>
#include <string.h>
#include "mqtt.h"

#define MQTT_BROKER_ADDR "mqtt://172.16.47.128:1883"
#define CLIENT_ID "my_mqtt_client"
#define TOPIC "desklight"
#define QOS 1
#define MESSAGE "Hello, MQTT from RIOT OS!"

static void message_received(mqtt_message_t *message, void *userdata)
{
    (void)userdata;
    printf("Received message on topic: %s\n", message->topic);
    printf("Message payload: %.*s\n", (int)message->payload_len, (char *)message->payload);
}

int main(void)
{
    mqtt_client_t client;
    mqtt_settings_t settings;

    settings.client_id = CLIENT_ID;
    settings.broker = MQTT_BROKER_ADDR;
    settings.port = 1883;
    settings.clean_session = 1;

    mqtt_init(&client, &settings);

    printf("Connecting to MQTT broker...\n");
    if (mqtt_connect(&client) != MQTT_OK)
    {
        printf("Failed to connect to the MQTT broker\n");
        return 1;
    }
    printf("Connected to MQTT broker\n");

    // Subscribe to a topic
    printf("Subscribing to topic: %s\n", TOPIC);
    if (mqtt_subscribe(&client, TOPIC, QOS, message_received, NULL) != MQTT_OK)
    {
        printf("Failed to subscribe to topic\n");
        return 1;
    }

    // Publish a message
    printf("Publishing message to topic: %s\n", TOPIC);
    if (mqtt_publish(&client, TOPIC, MESSAGE, strlen(MESSAGE), QOS, 0) != MQTT_OK)
    {
        printf("Failed to publish message\n");
        return 1;
    }
    printf("Message published\n");

    // Keep the client running
    while (1)
    {
        mqtt_yield(&client, 1000);
    }

    // Disconnect and cleanup (This code may not be reached in this simple example)
    mqtt_disconnect(&client);
    mqtt_cleanup(&client);

    return 0;
}
