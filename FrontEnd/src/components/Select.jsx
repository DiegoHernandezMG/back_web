import React, { useState } from "react";
import { Dropdown } from "primereact/dropdown";

export default function Select({ options, name }) {
  const [selectedOption, setSelectedOption] = useState(null);
  console.log(options);
  return (
    <div className="card flex justify-content-center">
      <Dropdown
        value={selectedOption}
        onChange={(e) => setSelectedOption(e.value)}
        options={options}
        optionLabel={name}
        filter
        placeholder="Select an option"
        className="w-full md:w-14rem"
      />
    </div>
  );
}
