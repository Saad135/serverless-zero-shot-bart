from transformers import pipeline
from transformers import AutoModelForSequenceClassification, AutoTokenizer


NLP_TASK = "zero-shot-classification"
NLP_MODEL = "./distilbart-mnli-12-1"

SEQUENCE_TO_CLASSIFY = "I have worked at this company for 20 years"
CANDIDATE_LABELS = ["experience", "education", "contact"]


def main():
    nli_model = AutoModelForSequenceClassification.from_pretrained(NLP_MODEL)
    nli_tokenizer = AutoTokenizer.from_pretrained(NLP_MODEL)

    classifier = pipeline(NLP_TASK, model=nli_model, tokenizer=nli_tokenizer)
    outputs = classifier(SEQUENCE_TO_CLASSIFY, CANDIDATE_LABELS)
    print(outputs)


if __name__ == "__main__":
    main()
