function toPascalCase(str) {
  return str
    .replace(/_([a-z])/g, (match, letter) => letter.toUpperCase())
    .replace(/^(.)/, (match, letter) => letter.toUpperCase());
}

function mapToPascalCase(data) {
  const mappedData = {};
  Object.keys(data).forEach((key) => {
    const pascalCaseKey = toPascalCase(key);
    mappedData[pascalCaseKey] = data[key];
  });
  return mappedData;
}

export function mapQuestionToFrontend(question) {
  return {
    Question: question.question,
    Solution: question.solution,
    CorrectAnswer: question.correctAnswer,
    ImageUrl: question.imageUrl,
    Options: question.options.map((option) => mapToPascalCase(option)),
    Steps: question.steps.map((step) => mapToPascalCase(step)),
    Tags: question.tags.map((tag) => mapToPascalCase(tag)),
  };
}
