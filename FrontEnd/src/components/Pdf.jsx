import React from "react";
import { Document, Page, Text, View, Image } from "@react-pdf/renderer";
import imagen from "./../images/bulbs.jpg";

const Pdf = ({ invitacion }) => {
  const lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
  return (
    <Document>
      <Page
        size="A4"
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "center",
          backgroundColor: "white",
        }}
      >
        <View
          style={{
            display: "flex",
            flexDirection: "column",
            justifyContent: "center",
            alignItems: "center",
            backgroundColor: "white",
            padding: 10,
          }}
        >
          <Text style={{ color: "#3388af", fontSize: "42px" }}>
            {invitacion.title}
          </Text>
          <Text>Por {invitacion.idUsuario}</Text>
          <Image
            //src="https://picsum.photos/600/400"
            src={imagen}
            style={{ maxWidth: "600px", maxHeight: "400" }}
          />
          <Text
            style={{
              color: "gray",
              fontStyle: "italic",
              fontSize: "10px",
            }}
          >
            {lorem}
          </Text>

          <Text style={{ textAlign: "justify", marginTop: "22px" }}>
            {invitacion.content}
          </Text>
        </View>
      </Page>

      {invitacion.asistenciaAcompaniante && (
        <Page
          size="A4"
          style={{
            display: "flex",
            flexDirection: "column",
            justifyContent: "center",
            alignItems: "center",
            backgroundColor: "white",
          }}
        >
          <View
            style={{
              display: "flex",
              flexDirection: "column",
              justifyContent: "center",
              alignItems: "center",
              backgroundColor: "white",
              padding: 10,
            }}
          >
            <Text style={{ color: "#3388af", fontSize: "42px" }}>
              {invitacion.title}
            </Text>
            <Text>Por {invitacion.idUsuario}</Text>
            <Image
              //src="https://picsum.photos/600/400"
              src={imagen}
              style={{ maxWidth: "600px", maxHeight: "400" }}
            />
            <Text
              style={{
                color: "gray",
                fontStyle: "italic",
                fontSize: "10px",
              }}
            >
              {lorem}
            </Text>

            <Text style={{ textAlign: "justify", marginTop: "22px" }}>
              {invitacion.content}
            </Text>
          </View>
        </Page>
      )}
    </Document>
  );
};

export default Pdf;
